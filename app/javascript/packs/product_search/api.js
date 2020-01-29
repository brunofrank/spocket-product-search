import axios from 'axios'

export default function loadProducts(query, order, filter={}) {
  filter = Object.keys(filter).map(key => `${key}=${filter[key]}`).join('&')

  return axios.get('/products/search', { params: { query, order, filter } })
}
