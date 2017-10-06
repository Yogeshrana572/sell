package review;

import java.util.List;

public interface FeedbackDao {
    void insert(Feedback f);
    void delete(int id);
    void update(Feedback f);
    
    Feedback getFeedback(int id);
    List<Feedback> getFeedback();
}
