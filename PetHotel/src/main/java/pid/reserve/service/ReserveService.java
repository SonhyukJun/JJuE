package pid.reserve.service;

import java.util.List;

public interface ReserveService {
	List<RoomVO> reserveAbleSearchRoom(ReserveVO vo) throws Exception;
	
	RoomVO reserveAbleRoomInformation(RoomVO vo) throws Exception;
}
