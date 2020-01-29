import { SEARCH, SORT, START_LOADING, FINNISH_LOADING, PRODUCTS_LOADED } from './actionTypes'

export function sort(orderBy) {
  return {
    type: SORT,
    payload: { orderBy },
  }
}

export function startLoading() {
  return { type: START_LOADING }
}

export function finnishLoading() {
  return { type: FINNISH_LOADING }
}

export function productsLoaded(products, query, orderBy, filter={}) {
  return {
    type: PRODUCTS_LOADED,
    payload: { products, query, orderBy, filter },
  }
}

export default function search(query) {
  return {
    type: SEARCH,
    payload: { query },
  }
}
