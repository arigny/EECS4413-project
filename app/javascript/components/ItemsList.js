import React from 'react';

const ItemsList = ({ items }) => {
    return (
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Bid</th>
                </tr>
            </thead>
            <tbody>
                {items.map((item) => (
                    <tr key={item.id}>
                        <td>{item.name}</td>
                        <td>{item.bid}</td>
                    </tr>
                ))}
            </tbody>
        </table>
    );
};

export default ItemsList;
