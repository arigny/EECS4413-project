import React from "react";

const deleteBeer = (id) => {
  const url = `api/v1/beers/${id}`;

  fetch(url, {
    method: "delete",
  })
    .then((data) => {
      if (data.ok) {
        this.reloadBeers();
        return data.json();
      }
      throw new Error("Network error.");
    })
    .catch((err) => message.error("Error: " + err));
};

const POItems = ({ po_items }) => {
  let subtotal = 0;
  let shippingfees = po_items.length;
  let grandTotal = 0;

  for (let i = 0; i < po_items.length; i++) {
    subtotal += po_items[i].price * po_items[i].quantity;
  }

  grandTotal = shippingfees + subtotal;

  return (
    <div>
      <table className="table table-hover">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Product Name</th>
            <th scope="col">Price</th>
            <th scope="col">Qty</th>
            <th scope="col">Subtotal</th>
            <th scope="col"></th>
          </tr>
        </thead>
        <tbody>
          {po_items.map((po_item) => (
            <tr>
              <th scope="row">{po_item.bid}</th>
              <td>{po_item.name}</td>
              <td>{po_item.price}</td>
              <td>{po_item.quantity}</td>
              <td>{po_item.price * po_item.quantity}</td>
              <td>
                <a
                  href={`po_items/${po_item.id}`}
                  method="delete"
                  className="card-link"
                >
                  Delete
                </a>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      <br />
      <br />

      <div className="col-sm-12">
        <h6>Cart Totals</h6>
        <div className="row">
          <div className="col-sm-4 border border-secondary">Subtotal</div>
          <div className="col-sm-2 border border-secondary">CA${subtotal}</div>
        </div>
        <div className="row">
          <div className="col-sm-4 border border-secondary">Shipping fees</div>
          <div className="col-sm-2 border border-secondary">
            CA${shippingfees}
          </div>
        </div>
        <div className="row">
          <div className="col-sm-4 border border-secondary">Grand Total</div>
          <div className="col-sm-2 border border-secondary">
            CA${grandTotal}
          </div>
        </div>
      </div>
      <br />

      <div className="row">
        <div className="col-sm-12 text-left">
          <a
            role="button"
            className="btn btn-secondary btn-md center-block"
            href={`items`}
            data-toggle="tooltip"
            data-placement="top"
            style={{ display: "inline-block" }}
          >
            Continue Shopping
          </a>

          <a
            role="button"
            className="btn btn-primary btn-md center-block"
            href={`purchase_orders/new`}
            data-toggle="tooltip"
            data-placement="top"
            style={{ display: "inline-block" }}
          >
            Check out
          </a>
        </div>
      </div>
    </div>
  );
};

export default POItems;
