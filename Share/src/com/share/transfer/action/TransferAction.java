package com.share.transfer.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.share.transfer.entity.Transfer;
import com.share.transfer.service.TransferService;

@SuppressWarnings("serial")
public class TransferAction extends ActionSupport implements ModelDriven<Transfer>{

	private Transfer transfer = new Transfer();
	public Transfer getModel() {
		return transfer;
	}
	
	private TransferService transferService;
	public void setTransferService(TransferService transferService) {
		this.transferService = transferService;
	}
	
	public String execute(){
		System.out.println("transfer..........");
		return NONE;
	}
}
