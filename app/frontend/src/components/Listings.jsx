import React from "react";

export const Listings = ({ listings }) => {
  const renderedListings = listings.map((listing) => {
    return <Listing key={listing.id} listing={listing}></Listing>
  })
  return <div className="listings-container">
    {renderedListings}
  </div>
}

export default Listings

const Listing = ({ listing }) => {
  const { title, picture } = listing
  return <div className="listing">
    <img src={picture}/>
    <span>{title}</span>
  </div>
}
