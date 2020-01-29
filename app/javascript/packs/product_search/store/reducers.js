import { SEARCH, SORT, START_LOADING, FINNISH_LOADING, PRODUCTS_LOADED } from './actionTypes'

const INITIAL_STATE = {
  orderBy: 'relevance',
  products: [],
  loading: true,
  filter: {}
}

export default function rootReducer(state = INITIAL_STATE, action) {
  switch (action.type) {
    case START_LOADING:
      return {
        ...state,
        loading: true,
      }
    case FINNISH_LOADING:
      return {
        ...state,
        loading: false,
      }
    case PRODUCTS_LOADED:
      return {
        ...state,
        products: action.payload.products,
        query: action.payload.query,
        orderBy: action.payload.orderBy,
        filter: action.payload.filter,
        loading: false,
      }
    default:
      return state
  }
}
