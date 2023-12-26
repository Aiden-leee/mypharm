package com.prj.mypharm;

import java.util.Arrays;

public class Test {

	public static void main(String[] args) {
		int[][] data = {{1, 20300104, 100, 80}, {2, 20300804, 847, 37}, {3, 20300401, 10, 8}};
		solution(data, "date", 20300501	, "remain");
	}
	public static int[][] solution(int[][] data, String ext, int val_ext, String sort_by) {
		int[][] list = new int[data.length][];
		
		String [] extList = {"code", "date", "maximum", "remain"};
		int extIdx = 0;
		int sortIdx = 0;
		for(int i=0; i<extList.length;i++){
			if( ext.equals(extList[i]) ) extIdx = i;
			if( sort_by.equals(extList[i]) ) sortIdx = i;
		}

		/*
		for(int i=0; i<data.length; i++) {
			if(data[i][extIdx] < val_ext ) list[i] = data[i]; 
			
		}*/
		
		
		int nonNullCount = 0;
        for (int i = 0; i < data.length; i++) {
            if (data[i][extIdx] < val_ext) {
                list[nonNullCount] = data[i];
                nonNullCount++;
            }
        }

        // Create a new array with non-null elements
        int[][] result = Arrays.copyOf(list, nonNullCount);

        // Print the result
        for (int[] row : result) {
            System.out.println(Arrays.toString(row));
        }

		System.out.println(Arrays.toString(list));
		
		

		return list;

	}
}
