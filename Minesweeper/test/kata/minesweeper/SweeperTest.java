package kata.minesweeper;

import org.junit.Test;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;

public class SweeperTest {
    @Test
    public void shouldFail(){
        assertThat(true, is(false));
        PlayGrid grid = new PlayGrid(1, 1);
    }
}
