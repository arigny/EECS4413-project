import React from "react";

const POItems = ({ po_items }) => {
  let subtotal = 0;
  for (let i = 0; i < po_items.length; i++) {
    subtotal += po_items[i].price * po_items[i].quantity;
  }

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
                <a href={`po_items/${po_item.id}`} className="card-link">
                  {" "}
                  See details
                </a>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      <br />
      <br />

      <h6>Cart Totals</h6>
      <table className="table">
        <thead>
          <tr>
            <th scope="col"></th>
            <th scope="col"></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">Subtotal</th>
            <td>CA${subtotal}</td>
          </tr>
          <tr>
            <th scope="row">Shipping fees</th>
            <td></td>
          </tr>
          <tr>
            <th scope="row">Grand Total</th>
            <td></td>
          </tr>
        </tbody>
      </table>

      <div>
        <div className="col-md-12 text-left f-l">
          <button
            role="button"
            className="btn btn-md btn-primary ml-2 button-icon rounded-large"
            href={`items`}
            data-toggle="tooltip"
            data-placement="top"
            title="previous"
          >
            Continue Shopping
          </button>
        </div>

        <div className="col-md-12 text-right f-r">
          <button
            role="button"
            className="btn btn-md btn-primary ml-2 button-icon rounded-small"
            href={`purchase_orders/new`}
            data-toggle="tooltip"
            data-placement="top"
            title="Next"
          >
            Check out
          </button>
        </div>
      </div>
    </div>
  );
};

export default POItems;
