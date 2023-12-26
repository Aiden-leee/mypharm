package com.prj.mypharm.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PharmDongVO {
	private String dong;
	private double lat;
	private double lng;
}
