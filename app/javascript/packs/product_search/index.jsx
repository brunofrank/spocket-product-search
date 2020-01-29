// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import { Provider } from 'react-redux'
import { Columns } from 'react-bulma-components'
import store from './store'

import List from './list'
import SearchBar from './searchBar'
import Sorter from './sorter'
import CountryFilter from './countryFilter'

const ProductSearch = () => (
  <div>
    <div>
      <SearchBar />
    </div>
    <Columns>
      <Columns.Column size={8}>
      </Columns.Column>
      <Columns.Column>
        <CountryFilter />
      </Columns.Column>
      <Columns.Column>
        <Sorter />
      </Columns.Column>
    </Columns>
    <div>
      <List />
    </div>
  </div>
)

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Provider store={store}>
      <ProductSearch />
    </Provider>,
    document.getElementById('product-search'),
  )
})
