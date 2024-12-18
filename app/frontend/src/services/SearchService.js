import axios from "axios";

const API_BASE_URL = '/api/v1/listings'

export async function search(query) {
  const response = await axios.get(API_BASE_URL + '/search', { params: { city: query.city, adults: query.adults }})
  //console.log(response.data)
  return response.data.listings
}
