const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profitDom = document.getElementById("profit");

priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   const fee = Math.floor(inputValue * 0.10); 
   const profit = inputValue - fee; 

   addTaxDom.innerHTML = fee; 
   profitDom.innerHTML = profit; 
});