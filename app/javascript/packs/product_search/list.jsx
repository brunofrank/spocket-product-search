import React, { useEffect, useState } from 'react'
import { useSelector, useDispatch } from 'react-redux'
import { finnishLoading } from './store/actions'

const List = () => {
  const dispatch = useDispatch()
  const products = useSelector(state => state.products)
  const loading = useSelector(state => state.loading)

  useEffect(() => {
    dispatch(finnishLoading())
  })

  return (
    <div>
      <table className="table is-striped is-narrow is-hoverable is-fullwidth">
        <thead>
          <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Country</th>
            <th>Tags</th>
            <th>Price</th>
            <th>Created At</th>
          </tr>
        </thead>
        <tbody>
          {loading &&
            <tr>
              <td colSpan={5} style={{textAlign: 'center'}}>Loading</td>
            </tr>}
          {!loading && products.length === 0 &&
            <tr>
              <td colSpan={5} style={{textAlign: 'center'}}>Nothing to show</td>
            </tr>}
          {products.map(product => (
            <tr key={product.id}>
              <td>{product.title}</td>
              <td>{product.description}</td>
              <td>{product.country}</td>
              <td>{product.tags && product.tags.join(',')}</td>
              <td>{product.price}</td>
              <td>{product.created_at}</td>
            </tr>)
          )}
        </tbody>
      </table>
    </div>
  )
}

export default List
