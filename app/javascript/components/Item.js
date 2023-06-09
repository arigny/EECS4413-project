import * as React from 'react';
import { GlassArView } from "@lastcode802/glassarview"; // import from https://github.com/lastcode802/glassarview#available-code


const Item = ({item, csrfToken, purchaseOrderId}) => {
    const addToCart = (item, csrfToken) => {
        fetch("/po_items", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": csrfToken,
          },
          body: JSON.stringify({
            item_id: item.id,
            bid: item.bid,
            name: item.name,
            quantity: 1,
            price: item.price,
            purchase_order_id: purchaseOrderId,
          }),
        })
        .then((response) => {
        if (response.ok) {
            alert("Item added to cart successfully!");
        } else {
            alert("Failed to add item to cart.");
        }

        const contentType = response.headers.get("content-type");
        if (contentType && contentType.indexOf("application/json") !== -1) {
            return response.json();
        } else {
            // console.error("Response doesn't have JSON content type");
            // throw new Error("Invalid JSON response");
        }
        })
        .then((data) => console.log("Response data: ", data))
        .catch((error) => console.error("Error in adding item to cart: ", error));
    };

    return (
        <div
          key={item.id}
          className="card hoverable"
          style={{ width: "18rem" }}
        >
          <div className="card-body">
            <GlassArView
              modelname="rayban_aviator_or_vertFlash"
              canvasheight={500}
              canvaswidth={500}
            />
            <h5 className="card-title">{item.name}</h5>
            <h6 className="card-subtitle mb-2 text-muted">${item.price}</h6>
            <p className="card-text">{item.description}</p>
            <button
              onClick={() => addToCart(item, csrfToken)}
              className="btn btn-primary"
            >
              Add to Cart
            </button>
            <a href={`items/${item.id}`} className="card-link">
              {" "}
              See details
            </a>
          </div>
        </div>
    )
}

export default Item;
