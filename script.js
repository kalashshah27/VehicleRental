function getRentalDays(){
  const s=document.getElementById('start_date')?.value,e=document.getElementById('end_date')?.value;
  if(!s||!e)return 0;
  const a=new Date(s+'T00:00:00'),b=new Date(e+'T00:00:00'),d=Math.round((b-a)/86400000);
  return d>=0?d+1:0;
}
function updateBillPreview(){
  const box=document.getElementById('liveBill');if(!box)return;
  const days=getRentalDays(),rate=window.vehicleRate||0;
  if(!days){box.innerHTML='<strong>Rental estimate</strong><br>Select valid start and end dates to calculate your bill.';return;}
  box.innerHTML='<strong>Rental estimate</strong><div style="margin-top:8px">Rental days: <b>'+days+'</b></div><div class="preview-total">Estimated total: ₹'+(days*rate).toLocaleString('en-IN')+'</div>';
}
function validateBooking(){if(getRentalDays()<=0){alert('Please select valid rental dates.');return false}return true}
function showQR(){
  const box=document.getElementById('qrBox');if(!box)return;
  box.classList.remove('hidden');
  setTimeout(()=>box.scrollIntoView({behavior:'smooth',block:'center'}),80);
}
function confirmPayment(){
  const confirmation=document.getElementById('bookingConfirmation');
  if(!confirmation)return;
  confirmation.classList.remove('hidden');
  confirmation.classList.add('show');
  const button=document.getElementById('confirmPaymentBtn');
  if(button){button.disabled=true;button.textContent='Booking Confirmed ✓';button.style.opacity='.7';button.style.cursor='default';}
  setTimeout(()=>confirmation.scrollIntoView({behavior:'smooth',block:'center'}),80);
}
document.addEventListener('DOMContentLoaded',()=>{
  ['start_date','end_date'].forEach(id=>document.getElementById(id)?.addEventListener('change',updateBillPreview));
  document.getElementById('confirmPaymentBtn')?.addEventListener('click',confirmPayment);
  updateBillPreview();
});
