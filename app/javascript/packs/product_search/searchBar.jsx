import React, { useState, useEffect } from 'react'
import { useDispatch, useSelector } from 'react-redux';
import loadProducts from './api'
import { productsLoaded, startLoading } from './store/actions'

const SearchBar = () => {
  const dispatch = useDispatch()
  const [query, setQuery] = useState('')
  const orderBy = useSelector(state => state.orderBy)
  const filter = useSelector(state => state.filter)

  useEffect(() => {
    performSearch()
  }, [])

  const performSearch = () => {
    dispatch(startLoading())

    loadProducts(query, orderBy, filter).then((response) => {
      dispatch(
        productsLoaded(response.data, query, orderBy)
      )
    })
  }

  const handlSearch = (event) => {
    if (event.key === 'Enter') performSearch()
  }

  return (
    <div>
      <input
        className="input"
        type="text"
        placeholder="Search..."
        onKeyPress={handlSearch}
        value={query}
        onChange={(event) => setQuery(event.target.value)}
      />
    </div>
  )
}

export default SearchBar
