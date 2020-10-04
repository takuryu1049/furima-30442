function calc() {
  const price_input = document.getElementById("item-price")
  const add_tax = document.getElementById("add-tax-price");//販売手数料
  const profit = document.getElementById("profit");
  price_input.addEventListener("input", () => {
    const the_price = price_input.value
    if  (300 <= the_price && the_price <= 9999999){
      let fee = the_price * 0.1;
      fee = Math.floor(fee);
      let profit_calc = the_price - fee;
      add_tax.textContent = fee;
      profit.textContent = profit_calc; 
    }else{
      let fee = "-";
      let profit_calc = "-";
      add_tax.textContent = fee;
      profit.textContent = profit_calc;
    }
  });
}
window.addEventListener('load', calc);
