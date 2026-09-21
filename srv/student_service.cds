using {student.db as model} from '../db/schema';

service StudentAPIService {
    entity StudentSet as projection on model.Students;
}
