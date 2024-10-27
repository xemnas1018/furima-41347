const price = () =>{
  const itemPrice = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profitPrice = document.getElementById("profit");
  const calculation = Math.floor(itemPrice.value * 0.10);
  taxPrice.innerHTML = calculation;
  profitPrice.innerHTML = itemPrice.value - calculation; 
}
window.addEventListener('input',price)
window.addEventListener('turbo:load',price)
window.addEventListener('turbo:render',price)







