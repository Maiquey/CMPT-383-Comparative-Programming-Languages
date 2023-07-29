#[derive(Debug, Clone)]
pub struct SummationError {
    msg: String,
}

use std::fmt;

impl std::error::Error for SummationError {}
impl fmt::Display for SummationError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{}", self.msg)
    }
}
impl From<std::io::Error> for SummationError {
    fn from(e: std::io::Error) -> SummationError {
        SummationError {
            msg: format!("io::Error: {}", e),
        }
    }
}
impl From<std::num::ParseIntError> for SummationError {
    fn from(e: std::num::ParseIntError) -> SummationError {
        SummationError {
            msg: format!("ParseIntError: {}", e),
        }
    }
}

pub fn sum_file_1(path: &std::path::Path) -> Result<i64, SummationError> {
    match std::fs::read_to_string(path) {
        Err(e) => {
            return Err::<i64, SummationError>(SummationError::from(e));
        }
        Ok(r) => {
            let read_in_file = r;
            let mut sum = 0;
            for int_char in read_in_file.trim().split('\n') {
                match int_char.parse::<i64>() {
                    Err(e) => {
                        return Err::<i64, SummationError>(SummationError::from(e));
                    }
                    Ok(r) => {
                        sum += r;
                    }
                }
            }
            return Ok(sum);
        }
    }
}

pub fn sum_file_2(path: &std::path::Path) -> Result<i64, SummationError> {
    let mut sum = 0;
    for int_char in std::fs::read_to_string(path)?.trim().split('\n') {
        sum += int_char.parse::<i64>()?;
    }
    return Ok(sum);
}