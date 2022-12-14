class decode_scoreboard extends uvm_component;
    `uvm_component_utils(decode_scoreboard)
    `uvm_analysis_imp_decl(_expected_ae)
    `uvm_analysis_imp_decl(_actual_ae)

    uvm_analysis_imp_expected_ae #(decode_out_transaction, decode_scoreboard) exp;
    uvm_analysis_imp_actual_ae #(decode_out_transaction, decode_scoreboard) act;
    
    decode_out_transaction q[$];
    decode_out_transaction temp;
    int index;
    int trans_num;
    int compare_num;
    int match_num;
    bit activity = 0;

    function new(string name = "decode_scoreboard", uvm_component parent=null);
        super.new(name,parent);
        index = 0;
        trans_num = 0;
        compare_num = 0;
        match_num = 0;
    endfunction

    virtual function void write_expected_ae(decode_out_transaction trans);
        temp = new();
        temp.do_copy(trans);
        q.push_back(temp);
        
    endfunction

    virtual function void write_actual_ae(decode_out_transaction trans);
        activity = 1;
        if(q.size() > 1)begin
            trans_num++;
            if(trans.compare(q[index]))begin
                $display("--------------------------------------------------------------------------------------------------");
                `uvm_info("DECODE_SCOREBOARD", {"transaction MATCHED\n--------------------------------------------------------------------------------------------------\n[[[[Expected]]]]\n", q[index].convert2string,"\n\n[[[[Actual]]]]\n", trans.convert2string}, UVM_MEDIUM)
                
                match_num++;
            end else begin
                $display("--------------------------------------------------------------------------------------------------");
                `uvm_error("DECODE_SCOREBOARD", {"transaction MIS-MATCHED\n--------------------------------------------------------------------------------------------------\n[[[[Expected]]]]\n", q[index].convert2string,"\n\n[[[[Actual]]]]\n", trans.convert2string})
            end
            temp = q.pop_front();
            compare_num++;
        end
    endfunction

    virtual function void build_phase(uvm_phase phase);
        exp = new("exp", this);
        act = new("act", this);
    endfunction

    virtual function void check_phase(uvm_phase phase);
        super.check_phase(phase);
        
        if(!activity)`uvm_error("SCBD","Activity not found in scoreboard");
        if(q.size()==0)`uvm_error("SCBD","Transaction Predictions have Mismatched!");
    endfunction

    virtual function void report_phase (uvm_phase phase);
        $display("\n\n\n--------------------------------------------------------------------------------------------------");
        $display("==============================================+++=================================================");
        `uvm_info("DECODE_SCOREBOARD_REPORT", $sformatf("\n--------------------------------------------------------------------------------------------------\nNumber of Expected Transactions: %d \nNumber of Comparisons: %d \nNumber of Matches: %d \n", trans_num, compare_num, match_num), UVM_MEDIUM)
        $display("==================================================================================================");
        $display("----------------------------------------------+++-------------------------------------------------\n\n\n");
        
    endfunction

endclass