# Use for deleting redundant checkpoints
#!/usr/bin/env bash

task_name='MNLI'
gpu_device=0
pruning_type=1000
# for spar in 50 55 60 65 70 75 80; do
for spar in 20 30 40 50 60 70 80; do
    dir=/home/bert/bert/BERT/${task_name}_gpu${gpu_device}_pruning_${spar}%_granularity_128_taylor_score_pruning_type_${pruning_type}_2021-04-09_10_g1p_0_epoch_1/model_0
    for t in 0 10100 ; do
        command="rm ${dir}/model.ckpt-${t}.data-00000-of-00001"
        eval $command
        command="rm ${dir}/model.ckpt-${t}.index"
        eval $command
        command="rm ${dir}/model.ckpt-${t}.meta"
        eval $command
    done
    command="rm ${dir}/model.ckpt-100.data-00000-of-00001.tempstate10516175661109161261"
    eval $command
done
