pub fn find_elt<T: Eq>(values: &Vec<T>, elt: T) -> Option<usize> {
    let vecSize = values.len();
    for i in 0..vecSize {
        if values[i] == elt {
            return Some(i);
        }
    }
    return None;
}
