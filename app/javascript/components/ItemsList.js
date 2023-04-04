import React from 'react';

const ItemsList = ({ items }) => {
    return (
        <div className='card-grid'>
        {items.map((item) => (
            <div key={item.id} className="card hoverable" style={{width: '18rem'}}>
                <div className="card-body">
                    <h5 className="card-title">{item.name}</h5>
                    <h6 className="card-subtitle mb-2 text-muted">${item.price}</h6>
                    <p className="card-text">{item.description}</p>
                    <a href={`po_items/new`} className="btn btn-primary">Add to cart</a>
                    <a href={`items/${item.id}`} className="card-link"> See details</a>
                </div>
            </div>
        ))}
        <br/>
        </div>
    );
};

export default ItemsList;
