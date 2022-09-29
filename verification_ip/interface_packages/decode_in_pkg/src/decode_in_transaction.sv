class decode_in_transaction extends uvm_sequence_item;

    `uvm_object_utils_begin(decode_in_transaction)
        `uvm_field_int()
    `uvm_object_utils_end

    rand op_t op;



    function new(string name = "decode_in_transaction");
        super.new(name);
    endfunction


    virtual function string convert2string();
        ///$sformatf(super.convert2string());
    endfunction

    function void randomize_transaction();
        case(op_t)
            ADD: begin 

                 end
        endcase

    endfunction

    virtual function void add_to_wave();

    endfunction

endclass