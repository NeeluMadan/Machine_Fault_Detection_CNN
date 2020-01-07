# Machine Fault Detection using CNN

Dataset is taken from PHM challenge 2009, consist of 13 categories of machine faults. It is a multi-class classification problem with classes as Helical 1, Helical 2, Helical 3, Helical 4, Helical 6, spur 1, spur 2, spur 3, spur 4, spur 5, spur 6, spur 7, spur 8.

## Preprocessing

- Sampled reading from 1st sensor at an interval of 10,000 for each class.
- Created kurtogram from the sampled data.
- Kurtogram is saved as an image on disk with a size of 48\*48*3.
- each class consisting of 539 images.

Sample input images (Kurtograms):
![](https://github.com/NeeluMadan/Machine_Fault_Detection_CNN/blob/master/images/sample_inputs.png)

## Overfitting curve:

Training progress for each epoch
![](https://github.com/NeeluMadan/Machine_Fault_Detection_CNN/blob/master/images/overfitting_curves.png)

## Results: 
Total accuracy (number of correct predictions by the model) on the test set (39 images) is 91.6%.

Confusion Matrix
![](https://github.com/NeeluMadan/Machine_Fault_Detection_CNN/blob/master/images/confusion_matrix.png)

