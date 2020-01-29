import React, { useState, useEffect } from 'react'
import { useDispatch, useSelector } from 'react-redux';
import loadProducts from './api'
import { productsLoaded, startLoading } from './store/actions'

const CountryFilter = () => {
  const dispatch = useDispatch()
  const products = useSelector(state => state.products)
  const query = useSelector(state => state.query)
  const orderBy = useSelector(state => state.orderBy)
  const [countries, setCountries] = useState([])

  const handleFilter = (event) => {
    const country = event.target.value
    dispatch(startLoading())

    loadProducts(query, orderBy, { country }).then((response) => {
      dispatch(
        productsLoaded(response.data, query, orderBy, { country })
      )
    })
  }

  useEffect(() => {
    if (countries.length === 0) {
      setCountries([...new Set(products.map(product => product.country))])
    }
  })

  return (
    <div>
      <select onChange={handleFilter}>
        <option key="all" value="all">All countries</option>
        {countries.map(country => (
            <option key={country} value={country}>{country}</option>
          )
        )}
      </select>
    </div>
  )
}

export default CountryFilter
