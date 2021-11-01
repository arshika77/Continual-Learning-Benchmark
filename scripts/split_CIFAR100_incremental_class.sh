GPUID=$1
OUTDIR=outputs/split_CIFAR100_incremental_class
REPEAT=1
mkdir -p $OUTDIR
python -u iBatchLearn.py --dataset CIFAR100 --train_aug --gpuid $GPUID --repeat $REPEAT --incremental_class --optimizer Adam    --force_out_dim 100 --no_class_remap --first_split_size 20 --other_split_size 20 --schedule 80 120 160 --batch_size 128 --model_name WideResNet_28_2_cifar --model_type resnet --agent_type regularization --agent_name SI         --lr 0.001 --reg_coef 0.001        | tee ${OUTDIR}/SI.log
python -u iBatchLearn.py --dataset CIFAR100 --train_aug --gpuid $GPUID --repeat $REPEAT --incremental_class --optimizer Adam    --force_out_dim 100 --no_class_remap --first_split_size 20 --other_split_size 20 --schedule 80 120 160 --batch_size 128 --model_name WideResNet_28_2_cifar --model_type resnet --agent_type regularization --agent_name L2         --lr 0.001 --reg_coef 500          | tee ${OUTDIR}/L2.log
python -u iBatchLearn.py --dataset CIFAR100 --train_aug --gpuid $GPUID --repeat $REPEAT --incremental_class --optimizer Adam    --force_out_dim 100 --no_class_remap --first_split_size 20 --other_split_size 20 --schedule 80 120 160 --batch_size 128 --model_name WideResNet_28_2_cifar --model_type resnet --agent_type customization  --agent_name Naive_Rehearsal_1400  --lr 0.001              | tee ${OUTDIR}/Naive_Rehearsal_1400.log
python -u iBatchLearn.py --dataset CIFAR100 --train_aug --gpuid $GPUID --repeat $REPEAT --incremental_class --optimizer Adam    --force_out_dim 100 --no_class_remap --first_split_size 20 --other_split_size 20 --schedule 80 120 160 --batch_size 128 --model_name WideResNet_28_2_cifar --model_type resnet --agent_type regularization --agent_name MAS        --lr 0.001 --reg_coef 0.001        |tee  ${OUTDIR}/MAS.log 
 GT-RIPL /
Continual-Learning-Benchmark


