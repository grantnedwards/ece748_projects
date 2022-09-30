import uvm_pkg::*;
import decode_in_pkg::*;
import decode_test_pkg::*;


module hvl_top;

    initial begin : run_full_test
                run_test("test_top");
            end

endmodule
