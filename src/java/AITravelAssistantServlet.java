import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;

@WebServlet("/AITravelAssistantServlet")
public class AITravelAssistantServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String destination = request.getParameter("destination");
        String budgetParam = request.getParameter("budget");
        String daysParam = request.getParameter("days");
        String personsParam = request.getParameter("persons");
        String travelType = request.getParameter("travelType");
        String requirementType = request.getParameter("requirementType");

        try {

            double budget = Double.parseDouble(budgetParam);
            int days = Integer.parseInt(daysParam);
            int persons = Integer.parseInt(personsParam);

            // Basic validation
            if (budget <= 0 || days <= 0 || persons <= 0) {

                response.sendRedirect("aiTravelAssistant.jsp");
                return;
            }

            // Store user travel details in session
            request.getSession().setAttribute(
                    "aiDestination", destination
            );

            request.getSession().setAttribute(
                    "aiBudget", budget
            );

            request.getSession().setAttribute(
                    "aiDays", days
            );

            request.getSession().setAttribute(
                    "aiPersons", persons
            );

            request.getSession().setAttribute(
                    "aiTravelType", travelType
            );
            
            request.getSession().setAttribute(
                    "aiRequirementType", requirementType
             );

            // Go to result page
            response.sendRedirect("aiTravelResult.jsp");

        } catch (NumberFormatException e) {

            response.sendRedirect("aiTravelAssistant.jsp");
        }
    }
}