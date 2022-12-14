rm *.ucdb

make cli TEST_NAME=test_top TEST_SEED=64234323
make run_cli TEST_NAME=test_top TEST_SEED=4532234
make run_cli TEST_NAME=ctrl_test TEST_SEED=51443222
make run_cli TEST_NAME=load_test TEST_SEED=45322389
make run_cli TEST_NAME=store_test TEST_SEED=45322389
make run_cli TEST_NAME=alu_test TEST_SEED=75783472
make run_cli TEST_NAME=test_top TEST_SEED=78322389


make rank_coverage
make merge_coverage
make view_coverage
