package pid.reserve.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pid.reserve.service.ReserveDAO;
import pid.reserve.service.ReserveService;
import pid.reserve.service.ReserveVO;
import pid.reserve.service.RoomVO;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService{
	
	@Resource(name = "reserveDAOMybatis")
	private ReserveDAO reserveDAO;
	
	@Override
	public List<RoomVO> reserveAbleSearchRoom(ReserveVO vo) throws Exception {
		return reserveDAO.reserveAbleSearchRoom(vo);
	}
	
	@Override
	public RoomVO reserveAbleRoomInformation(RoomVO vo) throws Exception {
		return reserveDAO.reserveAbleRoomInformation(vo);
	}

}
