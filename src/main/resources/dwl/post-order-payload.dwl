%dw 2.0
output application/json
---
{
	orderId: p('app.order-prefix') ++ '@' ++ vars.input_payload.orderId,
	source: p('app.order-source'),
	customerName: vars.input_payload.buyer.fullName,
	contact: vars.input_payload.buyer.contact,
	items: vars.input_payload.foodItems map {
		productId: $.productCode,
		name: $.name,
		price: $.priceEach,
		quantity: $.qty	
	},
	totalAmount: vars.input_payload.amountDue,
	paymentType: vars.input_payload.paymentType,
	orderDate: vars.input_payload.orderedAt	
	
}