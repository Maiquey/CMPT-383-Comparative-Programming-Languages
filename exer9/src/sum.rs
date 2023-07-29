pub fn sum_loop_index(vector: &Vec<i64>) -> i64 {
    let mut acc = 0;
    for i in 0..vector.len() {
        acc += vector[i];
    }
    return acc;
}

pub fn sum_loop_iter(vector: &Vec<i64>) -> i64 {
    let mut acc = 0;
    for value in vector {
        acc += value
    }
    return acc;
}

pub fn sum_fold(vector: &Vec<i64>) -> i64 {
    vector.iter().fold(0, |acc, value| acc + value)
}

pub fn sum_method(vector: &Vec<i64>) -> i64 {
    vector.iter().sum()
}
