window.addEventListener('load',function(){
  const itemPrice = document.getElementById("item-price")
  const taxPrice = document.getElementById("add-tax-price")
  const profitPrice = document.getElementById("profit")
  itemPrice.addEventListener('input', function(){
    const price = Math.floor(this.value * 0.10);
    taxPrice.innerHTML = price;
    profitPrice.innerHTML = itemPrice.value - price; 
  })
})

