package ramly.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ramly.model.ItemCatalogue;
import ramly.dao.ItemCatalogueDAO;

public class CartController extends HttpServlet {  
    private static final long serialVersionUID = 1L;
    private ItemCatalogueDAO daoItem;
    static ArrayList<Integer> cartList = new ArrayList<>();
    static ArrayList<Integer> itemQuantity = new ArrayList<>();
    String forward = null;
    PrintWriter out;

    public CartController() {
        super();
        daoItem = new ItemCatalogueDAO();
    } 
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession cartsession = request.getSession();
            
        if(action.equalsIgnoreCase("addToCart")) {
            int id = Integer.parseInt(request.getParameter("id"));
            ItemCatalogue itemCatalogue = new ItemCatalogue();
            boolean check;     
            cartList = (ArrayList<Integer>)cartsession.getAttribute("cartlist"); //SESSION
            itemQuantity = (ArrayList<Integer>)cartsession.getAttribute("iQty"); //SESSION
                
            if(cartList == null) {
                check = false;
            }
            else {
                check = itemCatalogue.check(cartList, id);
            }
                
            if(check) {
                System.out.println("<<ITEM QUANTITY UPDATE>>");
                for(int i=0; i<itemQuantity.size(); i++) {
                    if(cartList.get(i) == id){
                        int itemFound = itemQuantity.get(i);
                        int quantity = itemFound + 1;
                        itemQuantity.set(i, quantity);
                        daoItem.minusStock(id, 1); //MINUS STOCK(DATABASE)WHEN ADDING ITEM TO CART
                    }
                }
                System.out.println("<<NEW ITEM>>");
                System.out.println("ITEM ID: " + cartList);
                System.out.println("ITEM QUANTITY: " + itemQuantity);
                cartsession.setAttribute("cartlist", cartList);
                cartsession.setAttribute("iQty", itemQuantity);
                forward = "CartController?action=viewCart";
            }  
            else {
                if(cartList == null) {
                    cartList = new ArrayList<>();
                    itemQuantity = new ArrayList<>();
                }                
                cartList.add(id);
                itemQuantity.add(1);
                daoItem.minusStock(id, 1); //MINUS STOCK(DATABASE)WHEN ADDING ITEM TO CART
                System.out.println("<<NEW ITEM>>");
                System.out.println("ITEM ID: " + cartList);
                System.out.println("ITEM QUANTITY: " + itemQuantity);
                System.out.println("NUMBER IN CART: " + cartList.size());
                cartsession.setAttribute("cartlist", cartList);
                cartsession.setAttribute("iQty", itemQuantity);
                forward = "ItemController?action=custCatalogue";
            }
        }
        else if(action.equalsIgnoreCase("minusFromCart")) {  
            int id = Integer.parseInt(request.getParameter("id"));
            ItemCatalogue itemCatalogue = new ItemCatalogue();
            boolean check;
            cartList = (ArrayList<Integer>)cartsession.getAttribute("cartlist"); //SESSION
            itemQuantity = (ArrayList<Integer>)cartsession.getAttribute("iQty"); //SESSION
            System.out.println("Removing (1) item [ID: " + id + "] from cart");
            
            if(cartList == null) {
                check = false;
            }
            else { 
                check = itemCatalogue.check(cartList, id);
            }

            if(check) {
                System.out.println("<<ITEM QUANTITY UPDATE>>");
                for(int i=0; i<itemQuantity.size(); i++) {
                     if(cartList.get(i) == id) {
                        int itemFound = itemQuantity.get(i);
                        if(itemFound == 1) {
                            System.out.println("Removing item id:" + cartList.get(i));
                            itemQuantity.remove(i);
                            cartList.remove(i);
                            daoItem.addStock(id, 1); //ADD STOCK(DATABASE)WHEN REMOVING ITEM TO CART
                        }
                        else {
                            int quantity = itemFound - 1;
                            itemQuantity.set(i, quantity);
                            daoItem.addStock(id, 1);  //ADD STOCK(DATABASE)WHEN REMOVING ITEM TO CART
                        }
                    }
                }
                System.out.println("<<MINUS ITEM>>");
                System.out.println("ITEM ID: " + cartList);
                System.out.println("ITEM QUANTITY: " + itemQuantity);
                cartsession.setAttribute("cartlist", cartList);
                cartsession.setAttribute("iQty", itemQuantity);
                forward = "CartController?action=viewCart";
            }  
            else {
                if(cartList == null) {
                    cartList = new ArrayList<>();
                    itemQuantity = new ArrayList<> ();
                }
                cartList.add(id);
                itemQuantity.add(1);
                daoItem.addStock(id, 1); //ADD STOCK(DATABASE)WHEN ADDING ITEM TO CART
                System.out.println("<<NEW ITEM>>");
                System.out.println("ITEM ID: " + cartList);
                System.out.println("ITEM QUANTITY: " + itemQuantity);
                System.out.println("NUMBER IN CART: " + cartList.size());
                cartsession.setAttribute("cartlist", cartList);
                cartsession.setAttribute("iQty", itemQuantity);
                forward = "ItemController?action=custCatalogue";
            }
        }
        else if(action.equalsIgnoreCase("viewCart")) {   
            cartList = (ArrayList<Integer>)cartsession.getAttribute("cartlist");
            itemQuantity = (ArrayList<Integer>)cartsession.getAttribute("iQty");  
            ArrayList<ItemCatalogue> listitem = new ArrayList<>();
                
            if(cartList != null) {
                for( int i=0; i<cartList.size(); i++){
                    listitem.add(daoItem.getItemById(cartList.get(i), itemQuantity.get(i)));
                }    
                    request.setAttribute("items", listitem);
            }    
            forward = "ShoppingCart.jsp";
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
}
