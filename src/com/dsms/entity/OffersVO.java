/**
 * 
 */
package com.dsms.entity;

/**
 * @author Rahul
 *
 */
public class OffersVO {
	private int offerValue;

	public int getOfferValue() {
		return offerValue;
	}

	public void setOfferValue(int offerValue) {
		this.offerValue = offerValue;
	}

	@Override
	public String toString() {
		return Integer.toString(offerValue);
	}
	
}
