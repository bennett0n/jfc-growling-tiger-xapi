%dw 2.0
output application/json
---
{
	orderId: (payload.orderId splitBy "@")[1] default payload.orderId,
	buyer: {
		fullName: payload.customer,
//		phone: payload.contact
	},
	foodItems: payload.items map {
		productCode: $.productId,
		name: $.name,
		priceEach: $.price,
		qty: $.quantity
	},
	amountDue: payload.totalAmount,
	orderedAt: payload.orderDate
}