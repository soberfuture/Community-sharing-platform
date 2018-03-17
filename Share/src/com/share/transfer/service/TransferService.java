package com.share.transfer.service;

import com.share.transfer.dao.TransferDao;
import com.share.transfer.entity.Transfer;

public class TransferService {

	private TransferDao transferDao;

	public void setTransferDao(TransferDao transferDao) {
		this.transferDao = transferDao;
	}

	public void save(Transfer transfer) {
		transferDao.save(transfer);
	}
	
}
