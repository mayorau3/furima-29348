function calc(){

  const priceInput = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  if (priceInput.getAttribute("data-load") != null) {
    return null;
  }
  priceInput.setAttribute("data-load", "true");
  priceInput.addEventListener('input', function(){
    price = this.value
    taxCalc = Math.floor(price * 0.1)
    profitCalc = price - taxCalc
    addTaxPrice.innerHTML = taxCalc
    profit.innerHTML = profitCalc
  });
}
setInterval(calc, 1000);