import React, { useState } from "react";
import Item from "./Item";

const ItemsList = ({ items, csrfToken, purchaseOrderId }) => {
  const [search, setSearch] = useState('');

  const onSearchChange = ({ target }) => {
    setSearch(target.value);
  }

  const filteredItems = () => {
    if (search.length === 0) {
      return items
    }

    const filtered = items.filter(
      (item) => item.name.includes(search.toLowerCase())
    )

    return filtered
  }

  return (
    <div>
      <input type="text" className="form-control searchbar" placeholder="Search products" value={search} onChange={onSearchChange}></input>
      <div className="card-grid card-body">
        {filteredItems().map((item) => (
          <Item key={item.id} item={item} />
        ))}
        <br />
      </div>
    </div>
  );
};

export default ItemsList;
