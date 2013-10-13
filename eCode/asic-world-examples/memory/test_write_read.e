<'
// This test case writes into one random location with 
// random data and reads it back to see if it writen and
// read back correctly
import mem_tb_top.e;
extend mem_txgen {

   gen_cmds()@clk is only {
    var i : int = 0;
    // Genrate the base object for write access
    gen mem_object keeping {
       it.rd_wr == TRUE;
    };
    // Drive the test case
    mem_driver.drive_mem(mem_object);
    wait cycle;
    // Read from same address
    mem_object.rd_wr = FALSE;
    mem_driver.drive_mem(mem_object);
    wait [5]*cycle;
   };
};
'>
