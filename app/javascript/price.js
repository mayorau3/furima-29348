window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  priceInput.addEventListener('input', function(){
    price = this.value
    taxCal = Math.floor(price * 0.1)
    profitCal = price - taxCal
    addTaxPrice.innerHTML = taxCal
    profit.innerHTML = profitCal
  })
})