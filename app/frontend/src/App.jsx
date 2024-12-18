import React, { useState } from "react"
import "./styles.scss"
import Listings from "./components/Listings"
import { search } from "./services/SearchService"

const DEFAULT_ADULTS = 2

export const App = () => {
  const [city, setCity] = useState('')
  const [adults, setAdults] = useState(DEFAULT_ADULTS)
  const [listings, setListings] = useState([])

  const clickSearch = async () => {
    const query = { city, adults }
    const response = await search(query)
    setListings(response)
  }

  return <div>
    <div className="search-container">
      <input type="text" placeholder="Search..." className="search-input" value={city} onChange={(e) => setCity(e.target.value)} />
      <input type="number" placeholder="Adults" className="number-input" value={adults} onChange={(e) => setAdults(e.target.value)} />
      <button className="search-button" onClick={clickSearch}>Search</button>
      <hr />
    </div>
    <div className="listings-wrapper">
      <Listings listings={listings} />
    </div>
  </div>
}

export default App
