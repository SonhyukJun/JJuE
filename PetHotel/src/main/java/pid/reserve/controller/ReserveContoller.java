package pid.reserve.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pid.reserve.service.ReserveService;
import pid.reserve.service.ReserveVO;
import pid.reserve.service.RoomVO;

@Controller
public class ReserveContoller {
	
	@Resource(name = "reserveService")
	private ReserveService reserveService;
	
	@RequestMapping(value = "/reserve.do", method = RequestMethod.GET)
	public String signUp() {
		return "reserve/reserve";
	}
	
	@RequestMapping(value = "/reservetest.do", method = RequestMethod.GET)
	public String reserveTest() {
		return "reserve/reservetest";
	}
	
	@RequestMapping(value = "/searchRoom", method = RequestMethod.POST)
	public String reserveAbleSearchRoom(ReserveVO reserveVo, Model model,
			@RequestParam(name="reserveStartDatee", required = true)String reserveStartDate,
			@RequestParam(name="reserveEndDatee", required = true)String reserveEndDate,
			@RequestParam(name="count",required = true)int count) throws Exception {
		
		reserveVo.setReserveStartDate((new SimpleDateFormat("yyyy-MM-dd")).parse(reserveStartDate));
		reserveVo.setReserveEndDate((new SimpleDateFormat("yyyy-MM-dd")).parse(reserveEndDate));
		System.out.println(reserveVo.toString());
		List<RoomVO> serachRoom = reserveService.reserveAbleSearchRoom(reserveVo);
		model.addAttribute("roomList",serachRoom);
//		 = new SimpleDateFormat("yyyy-MM-dd").parse(reserveStartDate);
//		vo.setReserveStartDate(reserveStartDate);
//		vo.setReserveEndDate(reserveEndDate);
//		System.out.println(vo.toString());
		return "reserve/reserveAbleRoom";
	}
	
	@RequestMapping(value = "/roominformationview", method =RequestMethod.GET)
	public String roomInformationView(RoomVO roomVo, Model model) throws Exception{
		System.out.println(roomVo.toString());
		RoomVO room = reserveService.reserveAbleRoomInformation(roomVo);
		model.addAttribute("room",room);
		return "reserve/roomInformation";
	}

}