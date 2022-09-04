import tensorflow as tf
import numpy as np
from matplotlib import pyplot as plt

fmnist = tf.keras.datasets.fashion_mnist

(training_images, training_labels), (test_images, test_labels) = fmnist.load_data()

# plt.imshow(training_images[5])
# plt.show()

# print(training_labels[5])


training_images = training_images/255.0
test_images = test_images/255.0

model = tf.keras.models.Sequential(
    [
        tf.keras.layers.Flatten(),
        tf.keras.layers.Dense(128, activation = 'relu'),
        tf.keras.layers.Dense(10, activation = 'softmax')
    ]
)

model.compile(optimizer = 'adam', loss = 'sparse_categorical_crossentropy', metrics = ['accuracy'])

model.fit(training_images, training_labels, epochs = 5)

model.evaluate(test_images, test_labels)
