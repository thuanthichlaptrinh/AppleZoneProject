package AppleZone.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class BaseDao {
	@Autowired
	protected JdbcTemplate _jdbcTemplate;
}
