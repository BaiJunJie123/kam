package com.dreamer.service.pmall.order;

import com.dreamer.domain.pmall.order.Order;
import com.dreamer.repository.mall.goods.MallGoodsDAO;
import com.dreamer.repository.pmall.order.OrderDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrderShippingHandler {

	@Transactional
	public void shipping(Order order){
////		deductGoodsStock(order);//发货不减少库存
//		order.shipping();
//		orderDAO.merge(order);
	}
	
	@Transactional
	public void deductGoodsStock(Order order){
//		order.getItems().entrySet().stream().forEach(entry->{
//			PmallGoods goods=mallGoodsDAO.findById(entry.getKey());
//			goods.deductCurrentStock(entry.getValue().getQuantity());
//		});
	}
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private MallGoodsDAO mallGoodsDAO;
}
