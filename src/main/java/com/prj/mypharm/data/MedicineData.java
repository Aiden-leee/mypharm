package com.prj.mypharm.data;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.prj.mypharm.medicine.domain.MedicineDTO;

public class MedicineData {
	public static void main(String[] args) throws IOException, ParseException {
		// 25345 / 300
		float totalCnt = getMedicineTotal();
		float max = 300;
		int rotate = (int) Math.ceil(totalCnt/max);
		List<MedicineDTO> list = new ArrayList<>();
		
		/**/
		for (int i = 1; i <= rotate; i++) {
			System.out.println(">>> " +i);
			try {
				Thread.sleep(1000);
				list.addAll( (Collection<? extends MedicineDTO>) getMedicineList(i) );
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		//list.addAll( (Collection<? extends MedicineDTO>) getMedicineList(1) ); 
		//list.addAll( (Collection<? extends MedicineDTO>) getMedicineList(59) ); 

		//System.out.println(list.size());
		//System.out.println(list);
		createCsv(list);
	}

	// 토탈 값 
	public static int getMedicineTotal() throws ParseException, IOException {
		String mediData = getMedicineData(1);
		// JSON 문자열을 JsonNode로 파싱
		JSONParser jsonParser = new JSONParser();
		//JSON데이터를 넣어 JSON Object 로 만들어 준다.
		JSONObject jsonObject = (JSONObject) jsonParser.parse(mediData);
		JSONObject body = (JSONObject) jsonObject.get("body");
		int totalcnt = Integer.parseInt( String.valueOf( body.get("totalCount") ) );
		return totalcnt;
	}

	// 데이터 담기 
	public static List<MedicineDTO> getMedicineList(int p) throws IOException {

		String mediData = getMedicineData(p);
		int no = p + (p-1) * 300;
		MedicineDTO medicine = null;

		List<MedicineDTO> list = new ArrayList<>();
		try {
			// JSON 문자열을 JsonNode로 파싱
			JSONParser jsonParser = new JSONParser();
			//JSON데이터를 넣어 JSON Object 로 만들어 준다.
			JSONObject jsonObject = (JSONObject) jsonParser.parse(mediData);
			JSONObject body = (JSONObject) jsonObject.get("body");
			Long totalcnt = (Long) body.get("totalCount");
			JSONArray items = (JSONArray) body.get("items");

			System.out.println(totalcnt);
			for (int i = 0; i < items.size(); i++) {

				JSONObject item = (JSONObject) items.get(i);
				/*
				System.out.println("===========================");
				System.out.println("성분명 :" + item.get("ITEM_NAME") );
				System.out.println("제품영문명 :" + item.get("ITEM_ENG_NAME") );
				System.out.println("분류번호 :" + item.get("CLASS_NO") );
				System.out.println("분류명 :" + item.get("CLASS_NAME") );
				System.out.println("구분 :" + item.get("ETC_OTC_NAME") );
				System.out.println("제형 :" + item.get("FORM_CODE_NAME") );
				System.out.println("판매사명 :" + item.get("ENTP_NAME") );
				System.out.println("이미지 :" + item.get("ITEM_IMAGE") );
				System.out.println("성상 :" + item.get("CHART") );
				System.out.println("모양 :" + item.get("DRUG_SHAPE") );
				System.out.println("색깔(앞) :" + item.get("COLOR_CLASS1") );
				System.out.println("색깔(뒤) :" + item.get("COLOR_CLASS2") );
				 */
				int cateno = 0;
				if( item.get("CLASS_NO") != null ) {
					cateno = Integer.parseInt( (String) item.get("CLASS_NO") );
				}
				medicine = MedicineDTO.builder()
						.no(no++)
						.name((String) item.get("ITEM_NAME"))
						.ename((String)item.get("ITEM_ENG_NAME"))
						.cate_no( cateno )
						.cate_name((String) item.get("CLASS_NAME"))
						.otc_name((String) item.get("ETC_OTC_NAME"))
						.formul((String) item.get("FORM_CODE_NAME"))
						.company((String) item.get("ENTP_NAME"))
						.img((String) item.get("ITEM_IMAGE"))
						.chart((String) item.get("CHART"))
						.shape((String) item.get("DRUG_SHAPE"))
						.color1((String) item.get("COLOR_CLASS1"))
						.color2((String) item.get("COLOR_CLASS2"))
						.build();
				list.add(medicine);
			}
			//System.out.println(list);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return list;
	}

	// medicine 데이터 string 추출
	public static String getMedicineData(int p) throws IOException {
		String page = String.valueOf(p);
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1471000/MdcinGrnIdntfcInfoService01/getMdcinGrnIdntfcInfoList01"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=YqMPmuX2fv%2BOYOZp2kocHPEL%2BZC6poam5B4rswEEmmKDcme%2Bjk2dSTzyBg8cep%2BMCN2bdFWyaOAZLxDZQEHEgw%3D%3D"); /*Service Key*/
		//        urlBuilder.append("&" + URLEncoder.encode("item_name","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*품목명*/
		//        urlBuilder.append("&" + URLEncoder.encode("entp_name","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*업체명*/
		//        urlBuilder.append("&" + URLEncoder.encode("item_seq","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*품목일련번호*/
		//        urlBuilder.append("&" + URLEncoder.encode("img_regist_ts","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*약학정보원 이미지 생성일*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(page, "UTF-8")); /*페이지번호*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("300", "UTF-8")); /*한 페이지 결과 수*/
		//        urlBuilder.append("&" + URLEncoder.encode("edi_code","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*보험코드*/
		urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답데이터 형식(xml/json) default : xml*/
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		return sb.toString();
	}

	public static void createCsv( List<MedicineDTO> data) {

		String filePath = "/Users/dhl/csv_medicine.csv";

		File file = null;
		BufferedWriter bw = null;
		String NEWLINE = System.lineSeparator(); // 줄바꿈(\n)

		try {
			file = new File(filePath);
			bw = new BufferedWriter(new FileWriter(file));


			bw.write("no,name,ename,cate_no,cate_name,otc_name,formul,company,img,chart,shape,color1,color2");
			bw.write(NEWLINE);

			for (int i = 0; i < data.size(); i++) {
				MedicineDTO dto = data.get(i);
				/*
				System.out.printf("%d,%s,%s,%d,%s,%s,%s,%s,%s,%s,%s,%s,%s", 
						dto.getNo(),dto.getName(),dto.getEname(),dto.getCate_no(),dto.getCate_name()
						,dto.getOtc_name(),dto.getFormul(),dto.getCompany(),dto.getImg()
						,dto.getChart(),dto.getShape(),dto.getColor1(),dto.getColor2());
				 */
				String chart = dto.getChart() != null ? dto.getChart().replaceAll("(\r\n|\r|\n|\n\r)", " ").replaceAll("\"", "\"\"") : "";
				String ename = dto.getEname() != null ? dto.getEname().replaceAll("(\r\n|\r|\n|\n\r)", " ").replaceAll("\"", "\"\"") : "";
				String str = String.format("%d,\"%s\",\"%s\",%d,\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\"", 
						dto.getNo(),dto.getName(),ename,dto.getCate_no(),dto.getCate_name()
						,dto.getOtc_name(),dto.getFormul(),dto.getCompany(),dto.getImg()
						,chart,dto.getShape(),dto.getColor1(),dto.getColor2()
						);
				bw.write(str);
				bw.write(NEWLINE);
			}

			bw.flush();
			bw.close();

			System.out.println("> created csv..");
		} catch (Exception e) {
			e.printStackTrace();
		}


	}
}
