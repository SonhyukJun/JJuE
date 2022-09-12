package pid.reserve.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import pid.reserve.service.ReserveDAO;
import pid.reserve.service.ReserveVO;
import pid.reserve.service.RoomVO;

@Repository("reserveDAOMybatis")
public class ReserveDAOMybatis extends EgovAbstractMapper implements ReserveDAO{
	
	@Override
	public List<RoomVO> reserveAbleSearchRoom(ReserveVO vo) throws Exception {
		List<RoomVO> searchRoom = selectList("searchRoom", vo);
		return searchRoom;
	}
	
	@Override
	public RoomVO reserveAbleRoomInformation(RoomVO vo) throws Exception {
		return selectOne("roomInformation", vo);
	}

}
