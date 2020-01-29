import React, { useState } from 'react'
import { useDispatch, useSelector } from 'react-redux';
import loadProducts from './api'
import { productsLoaded, startLoading } from './store/actions'

const Sorter = () => {
  const dispatch = useDispatch()
  const query = useSelector(state => state.query)
  const filter = useSelector(state => state.filter)

  const handleSort = (event) => {
    const orderBy = event.target.value

    dispatch(startLoading())

    loadProducts(query, orderBy, filter).then((response) => {
      dispatch(
        productsLoaded(response.data, query, orderBy, filter)
      )
    })
  }

  return (
    <div>
      <select onChange={handleSort}>
        <option value="relevance">Relevance</option>
        <option value="newest">Newest</option>
        <option value="lowest_price">Lowest Price</option>
        <option value="highest_price">Highest Price</option>
      </select>
    </div>
  )
}

export default Sorter
